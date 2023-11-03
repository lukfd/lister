import axios from 'axios'

export function getLibraries () {
    return axios.get("http://localhost:3000/api/libraries")
}

export function postNewLibrary (json) {
    return axios.post("http://localhost:3000/api/newLibrary", json)
}