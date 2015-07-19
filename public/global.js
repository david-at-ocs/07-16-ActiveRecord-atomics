var hamburgerMenu = document.getElementById("hamburger");
var mobileNav = document.getElementById("mobileNav");

hamburgerMenu.onclick = toggle_visibility;
// document.onresize = toggle_mobile_nav;

function toggle_visibility() {
 
  if (mobileNav.style.visibility == "visible") {
    mobileNav.style.visibility = "hidden";
  } else {
    mobileNav.style.visibility ="visible";
  }
}