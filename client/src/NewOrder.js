import './App.css'
import React, { useState, } from 'react';
import axios from 'axios';
import { Link } from 'react-router-dom';
import Select from 'react-select';
function NewOrder(){
    

    const supermarkets = [
        {value: "0", label: "Select Supermarket"},
        {value: "1", label: "Sainsbury's"},
        {value: "2", label: "Aldi"},
        {value: "3", label: "Lidl"},
        {value: "4", label: "Tesco"}
    ];

    const [selectedOption, setSelectedOption] = useState(supermarkets[0]);
    const [errorMessage, seterrorMessage] = useState('');
    const handleSubmit = async (a) => {
        a.preventDefault();
        if(!selectedOption){
            seterrorMessage('Please select a supermarket');
            return;
        }
        try{
            const response = await axios.post('http://localhost:8080/api/NewOrder', {
                supermarket_name: selectedOption.value,
            });
            console.log(response.data);
            seterrorMessage('');
        }
        catch (error){
            seterrorMessage('Failed to select supermarket, try again');
            console.error(error);
        }
    };

    const handleChange = (option) => {
        setSelectedOption(option);
    }


    //styles here because app.css seems to have 0 effect on the dropdown
    const customStyles = {
        option: (provided, state) => ({
            ...provided,
            backgroundColor: state.isSelected
                ? "#758BFD" //selected
                : state.isFocused
                ? "#758BFD" //hovering
                : "#758BFD",       //default
            color: "#F1F2F6",
            padding: 10
        }),
        control: (provided) => ({
            ...provided,
            borderColor: "#27187E",
            boxShadow: "none",
        })
    };



    return(
        <div>
           <ul>
           {/* {data && Array.isArray(data) && data.map((post, index) => (
                <li key={post.title}>{post.title}</li>
            ))} */}
           </ul>
           <form className='newOrder' onSubmit={handleSubmit}>
            <label>
                Supermarket
                {/* <select className='superMarket'>
                    <option value="NoOp">Please Choose a Shop</option>
                    <option value = "Sainsburys">Sainsburys</option>
                    <option value="Lidl">Lidl</option>
                    <option value="Tesco">Tesco</option>
                    <option value="Aldi">Aldi</option>
                </select> */}
                <Select 
                    value={selectedOption}
                    onChange={handleChange}
                    options={supermarkets}
                    styles={customStyles}
                />
            </label>
            <br/>
            <button type="submit" disabled = {selectedOption.value === "0"}>
                {selectedOption.value === "0" ? "Please select a supermarket" : <Link to="/EditOrder">Start Order</Link>}
            </button>
           </form>
            {errorMessage && <p style={{ color: ' red '}}>{errorMessage}</p>}
        </div>
        
        
    );
}

export default NewOrder;