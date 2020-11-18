import React from "react";
import Cart from "./Cart";
import { usePage } from "@inertiajs/inertia-react";

export default function Header() {
  const { header_image } = usePage().props;

  return (
    <header>
      <nav>
        <img src={header_image} alt="logo" width="60" />
        <Cart />
      </nav>
      <h1>Buy Our Stuff</h1>
      <h3>Make Us Rich</h3>
    </header>
  );
}
