import React from "react";
import { usePage } from "@inertiajs/inertia-react";

export default function Cart() {
  const { cart } = usePage().props;

  return (
    <ul>
      {cart.map((product) => (
        <li key={product.id}>{product.name}</li>
      ))}
    </ul>
  );
}
