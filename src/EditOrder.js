
import './App.css';
import React, { useState, useEffect } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
function EditOrder(){
    // const [data, setData] = useState(null);
    // const [loading, setLoading] = useState(true);
    // const [error, setError] = useState(null);

    // useEffect(() => {
    //     const fetchData = async() => {
    //         try {
    //             const response = await axios.get('http://localhost:8080/api/NewOrder')
    //             setData(response.data);
    //             setLoading(false);
    //         } catch (err){
    //             setError(err.message);
    //             setLoading(false);
    //         }
    //     };
    //     fetchData();
    // }, []);

    // if(loading){
    //     return <div>Loading...</div>;
    // }

    // if(error){
    //     return <div>Error: {error}</div>
    // }

    return(
            <div>
           <ul>
           {/* {data && Array.isArray(data) && data.map((post, index) => (
                <li key={post.title}>{post.title}</li>
            ))} */}
           </ul>
           <p>
                Order Number:
           </p>
           <button><Link to='/ShopItems'>Add Item</Link></button>
           <table className='Orders'>
                <tr>
                    <th>Item</th>
                    <th>Unit cost</th>
                    <th>No. Units</th>
                    <th>Total Cost</th>
                    <th>Added by</th>
                </tr>
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
                    <option value="NoOp">Please Choose an available discount</option>
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
