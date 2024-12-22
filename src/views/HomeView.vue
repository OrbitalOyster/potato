<script setup lang="ts">
import GooseSelect from '#components/GooseSelect.vue'
import GooseForm from '#components/GooseForm.vue'

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
  <div>
    <p>Home</p>
    <GooseForm
      id="mySampleForm"
    >
      <GooseSelect
        name="selectInput"
        store-id="mySampleForm"
        placeholder="Select something"
        :checks="['required']"
        :options
      />
    </GooseForm>
  </div>
</template>
