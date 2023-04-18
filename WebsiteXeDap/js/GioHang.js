function addToCart(item) {
    item.quantity = 1;
    var list;
    if (localStorage.getItem('cart') == null) {
        list = [item];
    } else {
        list = JSON.parse(localStorage.getItem('cart')) || [];
        let ok = true;
        for (let x of list) {
            if (x.proID == item.proID) {
                x.quantity += 1;
                ok = false;
                break;
            }
        }
        if (ok) {
            list.push(item);
        }
    }
    localStorage.setItem('cart', JSON.stringify(list));
    alert("Đã thêm giỏ hàng thành công!");
}
var listItem = JSON.parse(localStorage.getItem('cart'));

function HideEmptyCart() {
    if (listItem == null) {
        $('.box-container-cart').hide();
        $('.empty-cart').show();
        // var productOnCart = document.querySelector('.box-content')
        // productOnCart.style.display = 'none';
    } else {
        $('.box-container-cart').show()
        $('.empty-cart').hide();
    }
}


HideEmptyCart();

function LoadData() {
    var str = "";
    var t = 0;
    for (var x of listItem) {
        t += x.price * x.quantity;
        str += `
                        <tr>
                            <td class="box-img"><img src="` + x.imagePath + `"></td>
                            <td class="name-bike">
                            <p>` + x.title + ` - ` + x.color + `</p>
                            <small class="delete-product" onclick="Xoa(` + Number(x.proID) + `)"><i class="fa-solid fa-trash-can"></i>Xoá sản phẩm</small>
                            </td>
                            <td>` + x.price + `₫</td>
                            <td class="quantity">
                            <button onclick="Giam(` + Number(x.proID) + `)">-</button>
                            <input id = "q_` + Number(x.proID) + `" type="text"  onchange="updateQuantity(` + x.proID + `)" value="` + x.quantity + `">
                            <button onclick="Tang(` + Number(x.proID) + `)">+</button>
                            </td>
                            <td class="end-pay">` + (x.price * x.quantity) + `₫</td>
                        </tr>
        `
    }
    document.getElementById('listCart').innerHTML = str
    $("#spTong").text(t + '₫');
}

function xoaCart() {
    if (confirm("Bạn muốn xóa tất cả sản phẩm khỏi giỏ hàng!")) {
        localStorage.removeItem('cart')
        location.reload();
    }
}

function Xoa(id) {
    if (confirm("Bạn muốn xóa sản phẩm này khỏi giỏ hàng!")) {
        listItem = listItem.filter(x => x.proID != id);
        localStorage.setItem('cart', JSON.stringify(listItem));

        // if (index >= 0) {
        //     listItem.splice(index, 1);
        // }
        LoadData();
    }
}

function updateCart() {
    localStorage.setItem('cart', JSON.stringify(listItem));
    alert("Đã cập nhật thông tin giỏ hàng thành công!");
}

function Tang(id) {
    var index = listItem.findIndex(x => x.proID == id);
    if (index >= 0) {
        listItem[index].quantity += 1;
    }
    LoadData();
}

function Giam(id) {
    var index = listItem.findIndex(x => x.proID == id);
    if (index >= 0 && listItem[index].quantity >= 1) {
        listItem[index].quantity -= 1;
    }
    LoadData();
}

function updateQuantity(id) {
    var quantity = Number($('#q_' + id).val());
    var index = listItem.findIndex(x => x.proID == id);
    if (index >= 0 && listItem[index].quantity >= 1) {
        listItem[index].quantity = quantity;
    }
    LoadData();
}

LoadData();