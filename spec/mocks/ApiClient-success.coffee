whenjs = require 'when'

class ApiClientSuccess
  constructor: (baseUrl, access_token) ->
    if setTimeout.isSpy
      jasmine.unspy window, 'setTimeout'

  login: (client_id, user, pass) ->
    dfd = whenjs.defer()
    setTimeout ->
      this._access_token = '0123456789abcdef0123456789abcdef'
      dfd.resolve this._access_token
    , 1
    dfd.promise

  listDevices: ->
    dfd = whenjs.defer()
    setTimeout ->
      this._devices = [
        {
          "id": "51ff6e065067545724680187",
          "name": "Online Core",
          "last_app": null,
          "last_heard": null,
          "requires_deep_update": true,
          "connected": true
        }, {
          "id": "51ff67258067545724380687",
          "name": "Offline Core",
          "last_app": null,
          "last_heard": null,
          "connected": false
        }
      ]
      dfd.resolve this._devices
    , 1
    dfd.promise

  getAttributes: (coreID) ->
    dfd = whenjs.defer()
    setTimeout ->
      dfd.resolve {
        "id": coreID,
        "name": "Online Core",
        "connected": true,
        "variables": {},
        "functions": [],
        "cc3000_patch_version": "1.28"
      }
    , 1
    dfd.promise

  renameCore: (coreID, name) ->
    dfd = whenjs.defer()
    setTimeout ->
      dfd.resolve {
        "id": coreID,
        "name": name
      }
    , 1
    dfd.promise

  removeCore: (coreID) ->
    dfd = whenjs.defer()
    setTimeout ->
      dfd.resolve {
        "ok": true
      }
    , 1
    dfd.promise

  claimCore: (coreID) ->
    dfd = whenjs.defer()
    setTimeout ->
      dfd.resolve {
        "ok": true,
        "user_id": "53187f78907210fed300048f",
        "id": coreID,
        "connected": true
      }
    , 1
    dfd.promise

module.exports = ApiClientSuccess
