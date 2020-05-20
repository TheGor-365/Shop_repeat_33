const helloAlert = () => {
  let x = window.localStorage.getItem('bbb'); // x = hh['bbb']
  x++
  window.localStorage.setItem('bbb', x); // hh['bbb']
  alert(x);
}

const add_to_card = (id) => {
  let key = 'product_' + id;  // extract variable (refactoring)
  let x = localStorage.getItem(key);
  x++;
  window.localStorage.setItem(key, x);

  update_orders_input();
  update_orders_button();
}

const update_orders_button = () => {
  let text = 'Cart (' + cart_get_number_of_items() + ')';
  $('#orders_button').val(text);
}

const update_orders_input = () => {
  let orders = cart_get_orders();

  $('#orders_input').val(orders);
}

const cart_get_number_of_items = () => {
  let cnt = 0;

  for (let i = 0; i < window.localStorage.length; i++) {
    let key = window.localStorage.key(i); // get the key
    let value = window.localStorage.getItem(key); // get the value hh[key] = x

    if (key.indexOf('product_') == 0) {
      cnt += value;
    }
  }
  return cnt;
}

const cart_get_orders = () => {
  let orders = '';

  for (let i = 0; i < window.localStorage.length; i++) {
    let key = window.localStorage.key(i);
    let value = window.localStorage.getItem(key);

    if (key.indexOf('product_') === 0) {
      orders = orders + key + '=' + value + ',';
    }
  }
  return orders;
}
