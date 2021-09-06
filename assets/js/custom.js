window.addEventListener("load", function () {

  document.documentElement.style.visibility = "visible";

  var wcb = document.querySelectorAll('.card-body')
  for (var i = 0; i < wcb.length; i++) {
    child = wcb[i].children[0]
    if (child != null && child.innerHTML == '<i class="icon fa fa-info-circle"></i> Info') {
      wcb[i].style.background = '#282b36';
    }
  }


  var ccfh = document.querySelectorAll('.comment_card .card-header')
  for (var i = 0; i < ccfh.length; i++) {
    //console.log(child)
    if (ccfh[i] != null) {
      ccfh[i].style.borderTop = '0px solid #fff';
      ccfh[i].style.background = '#24262d';
    }
  }


});
