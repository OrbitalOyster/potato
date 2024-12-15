<script setup lang="ts">
import MyButton from '#components/MyButton.vue'
import { ref } from 'vue'

const count = ref(0)
</script>

<template>
  <h1>Hello, World!</h1>
  <button @click="count++">
    Click me
  </button>
  <p>Последний шанс снять бахиллы</p>
  <p>{{ count }}</p>
  <MyButton />
</template>

<style lang="sass">
$primary-color: blue

body
  font-size: 1.5 rem
  font-family: 'Exo 2 Variable'

h1
  color: $primary-color
</style>
