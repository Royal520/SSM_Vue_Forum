import {request} from "./request";

export function getUserDetail() {
  return request({
    url:'/user/detail'
  })
}

export function updateUser(param) {
  return request({
    url:'/user/updateUser',
    method:'post',
    data:param
  })
}

export function login(param) {
  return request({
    url:'/user/Login',
    method:'post',
    data:param
  })
}

export function checkName(name){
  let param = new URLSearchParams()
  param.append('username', name)
  return request({
    url:'/user/checkName',
    method: 'post',
    data:param
  })
}

export function logout() {
  return request({
    url:'/user/logout'
  })
}
