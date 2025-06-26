let Navigation = document.querySelector(".Navigation");
let Main = document.querySelector(".Main");
let Toggle = document.querySelector(".Toggle");

Toggle.onclick = () => {
    Navigation.classList.toggle("active");
    Main.classList.toggle("active");
}