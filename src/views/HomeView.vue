<script setup lang="ts">
import 'splitpanes/dist/splitpanes.css'
import { Pane, Splitpanes } from 'splitpanes'
import { faBuilding, faClipboard, faPencil } from '@fortawesome/free-solid-svg-icons'
import GooseAccordion from '#components/GooseAccordion.vue'
import { ref } from 'vue'

const accordionModel = ref([
  { id: 'orgs', title: 'Организации', icon: faBuilding },
  { id: 'forms', title: 'Формы', icon: faClipboard },
  { id: 'statuses', title: 'Статусы', icon: faPencil },
])
</script>

<template>
  <div class="fs">
    <p>Home</p>
    <Splitpanes vertical>
      <Pane
        max-size="50"
        size="25"
      >
        <aside>
          <GooseAccordion v-model="accordionModel">
            <template #Организации>
              <p>LoremIpsum</p>
            </template>
            <template #Формы>
              <p>Bar</p>
            </template>
          </GooseAccordion>
        </aside>
      </Pane>
      <Pane>
        <main>
          Main
        </main>
      </Pane>
    </Splitpanes>
  </div>
</template>

<style lang="sass" scoped>
aside
  background-color: transparent
  height: 100%
  padding: .5rem
  box-sizing: border-box

main
  background-color: orange
  height: 100%
  padding: .5rem
  box-sizing: border-box

:deep(.splitpanes__splitter)
  background-color: gray
  min-width: 8px

:deep(.splitpanes__pane)
  min-width: 16rem

</style>
