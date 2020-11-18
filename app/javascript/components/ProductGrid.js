import React from "react";
import { InertiaLink } from "@inertiajs/inertia-react";
import AddRemoveCart from "./AddRemoveCart";

export default function ProductGrid({ products }) {
  return (
    <section>
      {products.map((product) => (
        <aside key={product.id}>
          <img src={product.image_url} alt={product.name} />
          <h3>
            <InertiaLink href={`/products/${product.id}`}>
              {product.name}
            </InertiaLink>
          </h3>
          <p>Price: $ {product.price_cents / 100.0}</p>
          <p>{product.description}</p>
          <AddRemoveCart product={product} />
        </aside>
      ))}
    </section>
  );
}
