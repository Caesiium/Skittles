
import React, { useState} from 'react';
import axios from 'axios';
import { Link, useNavigate } from 'react-router-dom';
import Select from 'react-select';
function NewOrder({ setSelectedSupermarket, setOrderId }){

    const supermarkets = [
        {value: "0", label: "Select Supermarket"},
        {value: "1", label: "Sainsburys"},
        {value: "2", label: "Aldi"},
        {value: "3", label: "Lidl"},
        {value: "4", label: "Tesco"}
    ];
    const navigate = useNavigate();
    const [selectedOption, setSelectedOption] = useState(supermarkets[0]);
    const [errorMessage, seterrorMessage] = useState('');
    const handleSubmit = async (a) => {
        a.preventDefault();
        if(!selectedOption || selectedOption.value === "0"){
            seterrorMessage('Please select a supermarket');
            return;
        }
        console.log('selected', selectedOption);
        try{
            const response = await axios.post('http://localhost:8080/api/NewOrder', {
                supermarket_name: selectedOption.label,
            });
            console.log('Data here', response.data);
            setOrderId(response.data);
            navigate('/EditOrder');
        }
        catch (error){
            seterrorMessage('Failed to select supermarket, try again');
            console.error(error);
        }
    };

    const handleChange = (option) => {
        setSelectedOption(option);
        setSelectedSupermarket(option);
    }

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
                <Select 
                    value={selectedOption}
                    onChange={handleChange}
                    options={supermarkets}
                    styles={customStyles}
                />
            </label>
            <br/>
            <button 
                type="submit"
                disabled = {selectedOption.value === "0"}>
                {selectedOption.value === "0" 
                    ? "Please select a supermarket" 
                    : "Start Order"}
            </button>
           </form>
            {errorMessage && <p style={{ color: ' red '}}>{errorMessage}</p>}
        </div>
        
        
    );
}

export default NewOrder;