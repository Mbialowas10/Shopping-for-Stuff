import React from "react";
import Cart from "./Cart";
import ProductGrid from "./ProductGrid";

export default function App(props) {
  return (
    <>
      <Cart />
      <ProductGrid products={props.products} />
    </>
  );
}
