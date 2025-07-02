import mysql from 'mysql2';

const db = mysql.createConnection({
  host: 'localhost', // o el host que uses
  user: 'Erick',
  password: 'erickMV123@',
  database: 'educore',
});

db.connect(err => {
  if (err) {
    console.error('Error de conexión:', err);
  } else {
    console.log('¡Conexión exitosa!');
  }
  db.end();
});
