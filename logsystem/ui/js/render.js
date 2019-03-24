var connections = []
var kills = {}
var vehicles = {}
var weapons = {}

let currentMenu = 1;


function renderConnections(search) {
  let container = $(".logs");
  container.html("");
  currentMenu = 1;


  for (var i = connections.length-1; i > 0; i--) {
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


  for (var i = kills.length-1; i > 0; i--) {
    let log = kills[i];

    if(search==null || log.name.toLowerCase().includes(search) || log.steamID.toLowerCase().includes(search) || log.target.toLowerCase().includes(search)) {
      let html = '<div class="item">'
      +'<h3>'+log.name+'</h3>'
      +'<p><i class="fas fa-book-dead"></i> '+log.target+'</p>'
      +'<p><i class="fas fa-map-marker-alt"></i> Killer coords : '+log.killerCoords+'</p>'
      +'<p><i class="fas fa-map-marker-alt"></i> Target coords : '+log.targetCoords+'</p>'
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


  for (var i = vehicles.length-1; i > 0; i--) {
    let log = vehicles[i];
    if(search==null || log.name.toLowerCase().includes(search) || log.steamID.toLowerCase().includes(search) || log.target.toLowerCase().includes(search)) {
      let html = '<div class="item">'
      +'<h3>'+log.name+'</h3>'
      +'<p><i class="fas fa-car"></i> '+log.target+'</p>'
      +'<p><i class="fas fa-map-marker-alt"></i> Localisation : '+log.coords+'</p>'
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


  for (var i = weapons.length-1; i > 0; i--) {
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






function closeMenu() {
  $("#content").addClass("hidden");
  sendData("closeMenu", {});
}




function sendData(event, data) {
    $.post('http://logsystem/'+event, JSON.stringify(data));
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

      connections = mes.connections
      kills = mes.kills
      vehicles = mes.vehicles
      weapons = mes.weapons


      renderConnections();
    }
  });
};
