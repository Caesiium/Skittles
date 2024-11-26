const express = require('express');
const app = express();
const cors = require('cors');
app.use(cors());
const port = 8080;


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
