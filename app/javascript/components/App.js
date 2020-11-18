import React from "react";
import Header from "./Header";
import ProductGrid from "./ProductGrid";

export default function App(props) {
  return (
    <>
      <Header />
      <main>
        <ProductGrid products={props.products} />
      </main>
    </>
  );
}
