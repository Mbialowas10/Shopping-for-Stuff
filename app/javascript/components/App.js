import React, { useState } from "react";

export default function App(props) {
  return (
    <section>
      {props.products.map((product) => (
        <p>{product.name}</p>
      ))}
    </section>
  );
}
