var resourceName = '';

var connections = [];
var kills = [];
var vehicles = [];
var weapons = [];
var chat = [];

var currentMenu = 1;
var strings = {};
let darkmode = false;

function renderConnections(search) {
  let container = $(".logs");
  container.html("");
  currentMenu = 1;


  for (var i = connections.length-1; i >= 0; i--) {
    let log = connections[i];
    if(search==null || log.name.toLowerCase().includes(search) || log.steamID.toLowerCase().includes(search)) {
      let html = '<div class="item">'
      +'<h3>'+log.name+'</h3>'
      +'<p><i class="fas fa-plug"></i> '+log.info+'</p>'
      +'<p><i class="far fa-clock"></i> '+log.date+'</p>'
      +'<p><i class="fas fa-id-card"></i> '+log.steamID+'</p>'
      +'</div>';

      container.append(html);
    }
  }
}



function renderKills(search) {
  let container = $(".logs");
  container.html("");
  currentMenu = 2;


  for (var i = kills.length-1; i >= 0; i--) {
    let log = kills[i];

    if(search==null || log.name.toLowerCase().includes(search) || log.steamID.toLowerCase().includes(search) || log.target.toLowerCase().includes(search)) {
      let html = '<div class="item">'
      +'<h3>'+log.name+'</h3>'
      +'<p><i class="fas fa-book-dead"></i> '+log.target+'</p>'
      +'<p><i class="fas fa-map-marker-alt"></i> '+strings.killercoords+' : '+log.killerCoords+'</p>'
      +'<p><i class="fas fa-map-marker-alt"></i> '+strings.targetcoords+' : '+log.targetCoords+'</p>'
      +'<p><i class="far fa-clock"></i> '+log.date+'</p>'
      +'<p><i class="fas fa-id-card"></i> '+log.steamID+'</p>'
      +'</div>';

      container.append(html);
    }
  }
}


function renderVehicles(search) {
  let container = $(".logs");
  container.html("");
  currentMenu = 3;


  for (var i = vehicles.length-1; i >= 0; i--) {
    let log = vehicles[i];
    if(search==null || log.name.toLowerCase().includes(search) || log.steamID.toLowerCase().includes(search) || log.target.toLowerCase().includes(search)) {
      let html = '<div class="item">'
      +'<h3>'+log.name+'</h3>'
      +'<p><i class="fas fa-car"></i> '+log.target+'</p>'
      +'<p><i class="fas fa-map-marker-alt"></i> '+strings.localisation+' : '+log.coords+'</p>'
      +'<p><i class="far fa-clock"></i> '+log.date+'</p>'
      +'<p><i class="fas fa-id-card"></i> '+log.steamID+'</p>'
      +'</div>';

      container.append(html);
    }
  }
}


function renderWeapons(search) {
  let container = $(".logs");
  container.html("");
  currentMenu = 4;


  for (var i = weapons.length-1; i >= 0; i--) {
    let log = weapons[i];

    if(search==null || log.name.toLowerCase().includes(search) || log.steamID.toLowerCase().includes(search) || log.target.toLowerCase().includes(search)) {
      let html = '<div class="item">'
      +'<h3>'+log.name+'</h3>'
      +'<p><i class="fas fa-rocket"></i> '+log.target+'</p>'
      +'<p><i class="far fa-clock"></i> '+log.date+'</p>'
      +'<p><i class="fas fa-id-card"></i> '+log.steamID+'</p>'
      +'</div>';

      container.append(html);
    }
  }
}


function renderChat(search) {
  let container = $(".logs");
  container.html("");
  currentMenu = 5;


  for (var i = chat.length-1; i >= 0; i--) {
    let log = chat[i];

    if(search==null || log.name.toLowerCase().includes(search) || log.steamID.toLowerCase().includes(search) || log.target.toLowerCase().includes(search)) {
      let html = '<div class="item">'
      +'<h3>'+log.name+'</h3>'
      +'<p><i class="fas fa-comment-dots"></i> '+log.target+'</p>'
      +'<p><i class="far fa-clock"></i> '+log.date+'</p>'
      +'<p><i class="fas fa-id-card"></i> '+log.steamID+'</p>'
      +'</div>';

      container.append(html);
    }
  }
}

function toggleDarkmode() {
  darkmode = !darkmode;

  if(darkmode) {
    $("button[name='darkMode']").html('<i class="fas fa-lightbulb"></i>');
    $("#content").removeClass("toggleLightmode");
    $(".logs").removeClass("toggleLightmodeLogs");
    $("#content").addClass("toggleDarkmode");
    $(".logs").addClass("toggleDarkmodeLogs");
  }else {
    $("button[name='darkMode']").html('<i class="far fa-lightbulb"></i>');
    $("#content").removeClass("toggleDarkmode");
    $(".logs").removeClass("toggleDarkmodeLogs");
    $("#content").addClass("toggleLightmode");
    $(".logs").addClass("toggleLightmodeLogs");
  }
}





function closeMenu() {
  $("#content").addClass("hidden");
  sendData("closeMenu", {});
}




function sendData(event, data) {
    $.post('http://'+resourceName+'/'+event, JSON.stringify(data));
}




$(document).ready(function() {
  document.getElementById("searchTerm").addEventListener('input', function (evt) {
      let toSearch = this.value.toLowerCase();
      switch (currentMenu) {
        case 1:
          renderConnections(toSearch);
          break;
        case 2:
          renderKills(toSearch);
          break;
        case 3:
          renderVehicles(toSearch);
          break;
        case 4:
          renderWeapons(toSearch);
          break;
        case 5:
          renderChat(toSearch);
          break;
        default:

      }
  });
});


window.onload = function(e){
  // NUI Callback
  window.addEventListener('message', function(event){
    var mes = event.data;

    if(mes.show) {
      $("#content").removeClass("hidden");
      $("#content").removeClass("pop");
      $("#content").addClass("pop");

      document.getElementById('searchTerm').value = '';

      connections = mes.connections;
      kills = mes.kills;
      vehicles = mes.vehicles;
      weapons = mes.weapons;
      chat = mes.chat;


      renderConnections();
    }

    if(mes.setResourceName) {
      resourceName = mes.name;
    }


    if(mes.setString) {
      strings.killercoords = mes.killercoords;
      strings.targetcoords = mes.targetcoords;
      strings.localisation = mes.localisation;
    }
  });
};
