<script setup lang="ts">
  const props = defineProps({
    image: {
      type: String,
    },
  });
</script>

<template>
  <div class="slidev-layout speaker w-full h-full grid grid-cols-2">
    <div class="flex flex-col">
      <slot />

      <div class="flex flex-row justify-between w-fit gap-4 flex-grow items-center text-xl">
        <span v-if="$slidev.configs.twitter" class="gradient-text">
          <fa6-brands-square-x-twitter />
          {{ $slidev.configs.twitter }}
        </span> 
        <span v-if="$slidev.configs.github" class="gradient-text">
          <fa6-brands-github />
          {{ $slidev.configs.github }}
        </span>
        <span v-if="$slidev.configs.linkedin" class="gradient-text">
          <fa6-brands-linkedin />
          {{ $slidev.configs.linkedin }}
        </span>
      </div>
    </div>
    <div class="m-auto">
      <img class="rounded-full w-72 h-72 border-4 speaker-image" src="/profile.jpg" alt="Picture of {{ $slidev.configs.author }}"/>
    </div>

  </div>
</template>

<style>
  
</style>
