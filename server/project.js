const express = require('express');
const app = express();
const cors = require('cors');
require('dotenv').config();
const{ Pool } = require('pg');
app.use(cors());
const port = 8080;

//postgres connection
const pool = new Pool({
    host: process.env.DB_HOST,
    port: process.env.DB_PORT,
    user: process.env.DB_USER,
    password: process.env.DB_PASSWORD,
    database: process.env.DB_NAME,
})

pool.connect((err) => {
    if(err){
        console.error('Dase connection error', err.stack);
    } else{
        console.log('Database connected');
    }
});


//select all groceries
app.get('/api/ViewOrders', async (req,res) => {
    try{
        const result = await pool.query('SELECT * FROM groceries');
        res.json(result.rows);
    } catch{
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add user
app.post('/api/user', async (req, res) => {
    try{
        const { user_name, user_email, user_password } = req.body;
        const result = await pool.query(
            'INSERT INTO users (user_name, user_email, user_password) VALUES ($1, $2, $3) RETURNING *',
            [user_name, user_email, user_password]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add new order - CHANGE API ENDPOINT ACCORDING TO FRONTEND PAGES
app.post('/api/NewOrder', async (req, res) => {
    try{
        const { supermarket_id } = req.body;
        const result = await pool.query(
            'INSERT INTO orders (supermarket_id) VALUES ($1) RETURNING *',
            [supermarket_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add users to order

app.post('/api/NewOrder', async (req, res) => {
    try{
        const { order_id, user_id } = req.body;
        const result = await pool.query(
            'INSERT INTO users_in_orders (order_id, user_id) VALUES ($1, $2) RETURNING *',
            [order_id, user_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});

//add items to order

app.post('/api/NewOrder', async (req, res) => {
    try{
        const { order_id, user_id } = req.body;
        const result = await pool.query(
            'INSERT INTO users_in_orders (order_id, user_id) VALUES ($1, $2) RETURNING *',
            [order_id, user_id]
        );
        res.json(result.rows[0]);
    } catch (err) {
        console.error(err.message);
        res.status(500).send('Server error');
    }
});


const ViewOrdersData = [
  { title: 'View Orders'}
];

const NewOrderData = [
  { title: 'New Order'}
];

app.get('/api/ViewOrders', (req, res) =>{
  res.json(ViewOrdersData);
});

app.get('/api/NewOrder', (req, res) =>{
  res.json(NewOrderData);
});

// Start server
app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});