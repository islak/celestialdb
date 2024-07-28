import React, { useState } from 'react';
import Search from './components/Search';
import List from './components/List';

function App() {
    const [results, setResults] = useState([]);

    const handleSearch = async (name) => {
        const response = await fetch(`http://127.0.0.1:5000/search?name=${name}`);
        const data = await response.json();
        setResults(data.results);
    };

    return (
        <div style={{ padding: '20px' }}>
            <h1>Celestial Explorer</h1>
            <Search onSearch={handleSearch} />
            <List items={results} />
        </div>
    );
}

export default App;
