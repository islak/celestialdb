import React, { useState } from 'react';

function Search({ onSearch }) {
    const [name, setName] = useState('');

    const handleSubmit = () => {
        onSearch(name);
    };

    return (
        <div style={{ marginBottom: '20px' }}>
            <input
                type="text"
                placeholder="Search"
                value={name}
                onChange={(e) => setName(e.target.value)}
                style={{ marginRight: '10px' }}
            />
            <button onClick={handleSubmit}>Search</button>
        </div>
    );
}

export default Search;
