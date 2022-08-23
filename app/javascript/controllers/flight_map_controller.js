import { Controller } from "@hotwired/stimulus"
import * as L from "leaflet"
import "leaflet-arc"

export default class extends Controller {
  static targets = ["container"]

  connect() {
    this.map = L.map(this.containerTarget).setView([51.505, -0.09], 2);

    L.tileLayer("https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png", {
      maxZoom: 19,
      attribution: "© OpenStreetMap"
    }).addTo(this.map);
  }

  changeArrivalAirport(event) {
    fetch(`/airports/${event.detail.value}`)
      .then(response => response.json())
      .then(data => {
        if (this.arrivalCircle) {
          this.arrivalCircle.remove()
        }

        this.arrivalCircle = L.circle([data.lat, data.lng], {
          fillColor: "#FF0000",
          radius: 80
        })

        this.arrivalCircle.addTo(this.map)
        this.updateArc()
      })
  }

  changeDepartureAirport(event) {
    fetch(`/airports/${event.detail.value}`)
      .then(response => response.json())
      .then(data => {
        if (this.departureCircle) {
          this.departureCircle.remove()
        }

        this.departureCircle = L.circle([data.lat, data.lng], {
          fillColor: "#0000FF",
          radius: 80
        })

        this.departureCircle.addTo(this.map)
        this.updateArc()
      })
  }

  updateArc() {
    if (this.arc) {
      this.arc.remove()
    }

    if (this.departureCircle && this.arrivalCircle) {
      const departureLatLng = this.departureCircle.getLatLng()
      const arrivalLatLng = this.arrivalCircle.getLatLng()

      this.arc = L.Polyline.Arc([departureLatLng.lat, departureLatLng.lng], [arrivalLatLng.lat, arrivalLatLng.lng], {
        color: "#00FF00",
        opacity: 0.75,
        vertices: 200
      })

      this.arc.addTo(this.map)
    }
  }
}
