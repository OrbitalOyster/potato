<script setup lang="ts">
  import { Splitpanes, Pane } from 'splitpanes'
  import 'splitpanes/dist/splitpanes.css'
  import { ref } from 'vue'

</script>

<template>
  <div class="fs">
    <p>Home</p>
    <Splitpanes vertical>
      <Pane min-size="10" max-size="50" size="20">
        <aside>
          Sidepanel
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
  background-color: green
  height: 100%
  padding: 1rem

main
  background-color: orange
  height: 100%
  padding: 1rem

:deep(.splitpanes__splitter)
  background-color: transparent
  width: 8px

</style>
