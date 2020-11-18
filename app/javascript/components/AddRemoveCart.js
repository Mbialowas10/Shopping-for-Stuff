import React from "react";
import { Inertia } from "@inertiajs/inertia";
import { usePage } from "@inertiajs/inertia-react";

export default function AddRemoveCart({ product }) {
  const { cart } = usePage().props;
  const cart_ids = cart.map((p) => p.id);

  function add_to_cart(id) {
    Inertia.post("/cart", { id: id });
  }

  function remove_from_cart(id) {
    Inertia.delete(`/cart/${id}`);
  }

  return cart_ids.includes(product.id) ? (
    <button onClick={() => remove_from_cart(product.id)}>
      Remove From Cart
    </button>
  ) : (
    <button onClick={() => add_to_cart(product.id)}>Add To Cart</button>
  );
}
