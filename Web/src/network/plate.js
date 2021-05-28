import {request} from "./request";

export function getPlate() {
  return request({
    url:"/plate/all"
  })
}

export function getPlateArticle(id) {
  return request({
    url:"/plate/getArticlesByPlateId",
    params:{id:id}
  })
}
