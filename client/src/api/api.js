import axios from 'axios'

export function getLibraries () {
    return axios.get("/api/libraries")
}

export function postNewLibrary (json) {
    return axios.post("/api/newLibrary", json)
}