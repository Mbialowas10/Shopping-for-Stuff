import React, { useState } from "react";

export default function App(props) {
  return (
    <section>
      {props.products.map((product) => (
        <aside key={product.id}>
          <img src={product.image_url} alt={product.name} />
          <h3>{product.name}</h3>
          <p>Price: $ {product.price_cents / 100.0}</p>
          <p>{product.description}</p>
        </aside>
      ))}
    </section>
  );
}
