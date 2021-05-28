<template>
  <div id="app">
    <tabbar/>
    <router-view/>
  </div>

</template>

<script>
    import tabbar from "./components/tabbar"

    export default {
        components: {tabbar},
        name: 'App',
    }
</script>

<style>
@import "./assets/css/basic.css";

</style>
