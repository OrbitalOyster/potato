<template>
  <button type="button">
    MyButton
  </button>
</template>

<style scoped lang="sass">
  $primary-color: #1ABC9C
  $hover-color: #17A589
  $active-color: #148F77

  button
    padding: 1rem
    margin: 1rem
    border: none
    border-radius: .25rem
    font-size: 1.25rem
    color: white
    background-color: $primary-color
    outline: none
    cursor: pointer
    transform: translateY(0)
    transition: background-color 100ms ease-in-out, box-shadow 100ms ease-in-out, transform 100ms ease-in-out

  button:hover
    background-color: $hover-color
    transform: translateY(-.1rem)
    box-shadow: 0 .1rem 0 .1rem #0B5345

  button:active
    background-color: $active-color
    transform: translateY(0)
    box-shadow: 0 0 0 .1rem #0B5345

</style>
