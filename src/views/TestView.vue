<script setup lang="ts">
import { ref } from 'vue'
import GooseButton from '#components/GooseButton.vue'
import GooseForm from '#components/GooseForm.vue'
import GooseFormInput from '#components/GooseFormInput.vue'
import GooseInput from '#components/GooseInput.vue'
import GooseCheckbox from '#components/GooseCheckbox.vue'
import GoosePopover from '#components/GoosePopover.vue'
import GooseSelect from '#components/GooseSelect.vue'
import GooseTreeRoot from '#components/GooseTreeRoot.vue'

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
const cb = ref(null)

</script>

<template>
  <main>
    <p>Home</p>
    <GooseForm
      id="mySampleForm"
    >
      <GooseFormInput
        placeholder="From"
        name="sampleInput1"
        form-id="mySampleForm"
      />
      <hr>
      <GooseFormInput
        name="sampleInput2"
        form-id="mySampleForm"
      />
      <hr>
      <div class="validated">
        <GooseInput
          v-model="s0"
          validation="invalid"
          error="Invalid input here"
        />
      </div>
      <p>{{ s0 }}</p>
      <hr>
      <GooseSelect
        name="selectInput"
        form-id="mySampleForm"
        placeholder="Select something"
        :checks="['required']"
        :options
      />
      <hr>
      <div style="display: flex; gap: 1rem">
        <GoosePopover
          has-arrow
          click-toggle
          placement="top"
        >
          <GooseButton title="Click me" />
          <template #popover>
            <div style="padding: 1rem">
              Hello World!
            </div>
          </template>
        </GoosePopover>
        <GooseButton title="Alert" />
        </div>
      <hr>
      <GooseCheckbox
        v-model="cb"
        name="testCheckbox"
        title="click me"
      />
      <hr>
      <div
        class="card"
        style="padding: 1rem"
      >
        <GooseTreeRoot
          searchable
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
