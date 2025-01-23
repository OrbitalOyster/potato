<script setup lang="ts">
import { Splitpanes, Pane } from 'splitpanes'
import 'splitpanes/dist/splitpanes.css'
import { ref } from 'vue'
import { faHospital, faRightToBracket, faClipboard, faPencil } from '@fortawesome/free-solid-svg-icons'
import GooseAccordion from "#components/GooseAccordion.vue"

const slots = [
  { title: 'Организации', icon: faHospital },
  { title: 'Формы', icon: faClipboard },
  { title: 'Статусы', icon: faPencil },
]
</script>

<template>
  <div class="fs">
    <p>Home</p>
    <Splitpanes vertical>
      <Pane min-size="10" max-size="50" size="25">
        <aside>
          <GooseAccordion :slots>
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
  background-color: transparent
  width: 8px

</style>
