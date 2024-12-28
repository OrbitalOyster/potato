<script setup lang="ts">
  const props = defineProps<{
    title: string 
    mark: string
  }>()  

  const found = props.title.search(props.mark);
  let s1 = props.title
  let p = props.title
  let s2 = ''
  let status = false

  if (found !== -1) {
    status = true
    s1 = props.title.slice(0, found) 
    p = props.mark
    s2 = props.title.slice(found + props.mark.length)
  }

</script>

<template>
  <p>
    {{ s1 }}
    <mark v-if="status">
      {{ p }} 
    </mark>
    {{ s2 }}
  </p>
</template>
