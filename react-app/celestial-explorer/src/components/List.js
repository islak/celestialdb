import React from 'react';

function List({ items }) {
    return (
        <div>
            {items.length === 0 ? (
                <p>No results found</p>
            ) : (
                <ul>
                    {items.map((item, index) => (
                        <li key={index}>
                            <strong>{item[1]}</strong>: {item[2]} {/* Adjust based on your data */}
                        </li>
                    ))}
                </ul>
            )}
        </div>
    );
}

export default List;
