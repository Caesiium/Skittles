
import './App.css';
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link, useLocation } from 'react-router-dom';
function EditOrder({ selectedItems }){
    
    const location = useLocation();
    console.log('location', location.state);
    //const { selectedGroceries  = [] } = location.state || {}
    //const selectedItems = location.state?.selectedItems || [];
    console.log('maybe items?', selectedItems);
    const [groceryDetails, setGroceryDetails] = useState([]);
    const [loading, setLoading] = useState(false);
    const [error, setError] = useState(null);
    

    useEffect(() => {
        if(selectedItems.length > 0){
            console.log('stuff', selectedItems);
            const getGroceryInfo = async() => {
                setLoading(true);
                try{
                    console.log('Selected groceries:', selectedItems);
                    const response = await axios.post('http://localhost:8080/api/EditOrder', {
                        selectedItems: selectedItems}, 
                        {headers: {'Content-Type': 'application/json'}
                    });

                    console.log('server response', response.data);
                    setGroceryDetails(response.data);

                    // const detailsAndQuantities = response.data.map((item) => {
                    //     const areMatching = selectedItems.find((selected) => selected.grocery_id === item.grocery_id);
                    //     return{
                    //         ...item, quantity: areMatching ? areMatching.quantity: 0,
                    //     }
                    // })

                    //setGroceryDetails(detailsAndQuantities);

                    // setGroceryDetails((prevDetails) => {
                    //     const mapItems = new Map;
                    //     //create a new map to hold key pair values, being the grocery id and its details
                        
                    //     //this populates the map with the items already selected
                    //     prevDetails.forEach(item => {
                    //         mapItems.set(item.grocery_id, item);
                    //     });
                    //     //this adds new items with their details, or updates the quantities of the ones already there
                    //     response.data.forEach(newItem => {
                    //         const itemExisting = mapItems.get(newItem.grocery_id);
                    //         if(itemExisting){
                    //             //if the item is already in the map, update its quantity by finding the matching item in selectedItems, and adding its quantity
                    //             itemExisting.quantity += selectedItems.find(item => item.grocery_id === newItem.grocery_id).quantity;
                    //         } else {
                    //             mapItems.set(newItem.grocery_id, {
                    //                 // ... is a spread operator, remembers the items that came before the new item???
                    //                 ...newItem, quantity: selectedItems.find(tem => item.grocery_id === newItem.grocery_id).quantity
                    //             });
                    //         }
                        // });

                        // //make sure to convert the map back into an array so it can be displayed in the table
                        // return Array.from(mapItems.values());
                    // });
                    
                } catch (err){
                    setError('Failed to fetch grocery data, try again');
                    console.error(err.message);
                } finally{
                    setLoading(false);
                }
            };
            getGroceryInfo();
        }
        
    }, [selectedItems]);

    console.log('error', error);
    console.log('loading', loading);

    if(error){
        return <div>Error: {error.message}</div>;
    }

    return(
            <div>
           <p>
                Order Number:
           </p>
           <button><Link to='/ShopItems'>Add Item</Link></button>
           <table className='Orders'>
                <thead>
                    <tr>
                        <th>Item</th>
                        <th>Unit cost</th>
                        <th>No. Units</th>
                        <th>Total Cost</th>
                        <th>Added by</th>
                    </tr>
                </thead>
                <tbody>
                    {groceryDetails.map((row, index) => {
                        const item = selectedItems.find(
                            (selected) => selected.grocery_id === row.grocery_id
                        );
                        return (
                            <tr key={index}>
                                <td>{row.grocery_name}</td>
                                <td>{row.grocery_price}</td>
                                <td>{item?.quantity || 0}</td>
                                <td>{row.grocery_price * (item?.quantity || 0)}</td>
                            </tr>
                        );
                    })}
                </tbody>
           </table>

           <br/>
           <table className='Orders'>
                <tr>
                    <th>User</th>
                    <th>Total Cost</th>
                </tr>
           </table>
           <p>
                Total cost:
           </p>
           <label>
                Apply discount
                <select className='discount'>
                    <option value="NoOp">Please choose an available discount</option>
                </select>
            </label>
            <p>
                <button className='finish'>
                    Complete order
                </button>
            </p>
            
        </div>
        
        
    );
}

export default EditOrder;
