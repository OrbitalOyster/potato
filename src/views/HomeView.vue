<script setup lang="ts">
import 'splitpanes/dist/splitpanes.css'
import { Pane, Splitpanes } from 'splitpanes'
import { faBuilding, faClipboard, faClipboardList, faFileExcel, faPencil } from '@fortawesome/free-solid-svg-icons'
import GooseAccordion from '#components/GooseAccordion.vue'
import GooseTabs from '#components/GooseTabs.vue'
import { ref } from 'vue'

const accordionModel = ref([
  { id: 'orgs', title: 'Организации', icon: faBuilding },
  { id: 'forms', title: 'Формы', icon: faClipboard },
  { id: 'statuses', title: 'Статусы', icon: faPencil },
])

const slots = [
  { id: 'xlsx', title: 'Исходники', icon: faFileExcel },
  { id: 'initial', title: 'Первичные отчёты', icon: faClipboard },
  { id: 'complex', title: 'Сводные отчёты', icon: faClipboardList },
]
</script>

<template>
  <div class="fs">
    <header>
      <div class="logo">
        <img src="/goose.png">
        <h1>Gooseberry.js</h1>
      </div>
      <div>Главная - отчёты</div>
      <div>Вы зашли как:</div>
    </header>
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
          <GooseTabs :slots>
            <template #xlsx>
              <p>Foo</p>
            </template>
            <template #initial>
              <p>Bar</p>
            </template>
            <template #complex>
              <p>Baz</p>
            </template>
          </GooseTabs>
        </main>
      </Pane>
    </Splitpanes>
  </div>
</template>

<style lang="sass" scoped>
header
  display: flex
  align-items: center
  justify-content: space-between
  padding-left: .5rem
  padding-right: .5rem

.logo
  display: flex
  align-items: center
  gap: 1rem

img
  border-radius: 100%
  height: 4rem
  width: 4rem

h1
  display: inline

aside
  background-color: transparent
  height: 100%
  padding-right: 0
  box-sizing: border-box

main
  height: 100%
  padding-left: 0

.splitpanes
  box-sizing: border-box
  padding: .5rem

:deep(.splitpanes__splitter)
  /* background-color: gray */
  min-width: 8px

:deep(.splitpanes__pane)
  min-width: 16rem

</style>
