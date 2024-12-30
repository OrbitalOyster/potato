<script setup lang="ts">
import GooseButton from '#components/GooseButton.vue'
import GooseForm from '#components/GooseForm.vue'
import GooseInput from '#components/GooseInput.vue'
import GooseMarkable from '#components/GooseMarkable.vue'
import GoosePopover from '#components/GoosePopover.vue'
import GooseSelect from '#components/GooseSelect.vue'
import GooseTree from '#components/GooseTree.vue'
import { ref, watch } from 'vue'

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

const tree = [{
  title: 'Org1', sub: [
    { title: 'Org1.1', sub: [
      { title: 'Org1.1.1' },
    ] },
  ] }, {
  title: 'Org2', sub: [

  ] }, {
  title: 'Org3', sub: [
    { title: 'Org3.1' },
    { title: 'Org3.2' },
    { title: 'Org3.3', sub: [
      { title: 'Org3.3.1' },
      { title: 'Org3.3.2' },
      { title: 'Org3.3.3' },
      { title: 'Org3.3.4' },
    ] },
    { title: 'Org3.4' },
  ] },
]

const s0 = ref('foo')
const s = ref('ipsum')

</script>

<template>
  <main>
    <p>Home</p>
    <GooseForm
      id="mySampleForm"
    >
      <GooseInput
        placeholder="From"
        name="sampleInput1"
        store-id="mySampleForm"
      />
      <hr>
      <GooseInput
        name="sampleInput2"
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
      <hr>
      <GoosePopover
        has-arrow
        click-toggle
        placement="right"
      >
        <GooseButton title="Click me" />
        <template #popover>
          <div style="padding: 1rem">
            Hello World!
          </div>
        </template>
      </GoosePopover>
      <hr>
      <input v-model="s">
      <GooseMarkable
        title="Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua"
        :needle="s"
      />
      <hr>
      <div class="card">
        <GooseTree
          :tree
        />
      </div>
    </GooseForm>
  </main>
</template>

<style lang="sass" scoped>
  main
    padding: 1rem
</style>
