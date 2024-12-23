<script setup lang="ts">
import GooseForm from '#components/GooseForm.vue'
import GooseInput from '#components/GooseInput.vue'
import GooseSelect from '#components/GooseSelect.vue'

const options = [
  '1 Macao',
  '2 Madagascar',
  '3 Malawi',
  '4 Malaysia',
  '5 Maldives',
  '6 Mali',
  '7 Malta',
  '8 Marshall Islands (the)',
  '9 Martinique',
  '10 Mauritania',
  '11 Mauritius',
  '12 Mayotte',
  '13 Mexico',
  '14 Micronesia (Federated States of)',
  '15 Moldova (the Republic of)',
  '16 Monaco',
  '17 Mongolia',
  '18 Montenegro',
  '19 Montserrat',
  '20 Morocco',
]
</script>

<template>
  <main>
    <p>Home</p>
    <GooseForm
      id="mySampleForm"
    >
      <GooseInput
        placeholder="From"
        name="sampleInput"
        store-id="mySampleForm"
      />

      <hr>

      <GooseSelect
        name="selectInput"
        store-id="mySampleForm"
        placeholder="Select something"
        :checks="['required']"
        :options
      />
    </GooseForm>
  </main>
</template>

<style lang="sass" scoped>
  main
    padding: 1rem
</style>
