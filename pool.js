// pool.js
import mysql from 'mysql2/promise';
import dotenv from 'dotenv';

// Carga tu .env y OVERRIDE de verdad las variables del sistema:
dotenv.config({ path: './.env', override: true });

console.log('🔧 DB_HOST:', process.env.DB_HOST);
console.log('🔧 DB_PORT:', process.env.DB_PORT);
console.log('🔧 DB_USER:', process.env.DB_USER);
console.log('🔧 DB_NAME:', process.env.DB_NAME);

export const db = mysql.createPool({
  host:     process.env.DB_HOST,
  user:     process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  port:     Number(process.env.DB_PORT),
  waitForConnections: true,
  connectionLimit:    10,
  queueLimit:         0,
});

(async () => {
  try {
    const conn = await db.getConnection();
    console.log('✅ Pool conectado a MySQL');
    conn.release();
  } catch (err) {
    console.error('❌ No se pudo conectar al pool:', err.code, err.message);
    process.exit(1);
  }
})();
