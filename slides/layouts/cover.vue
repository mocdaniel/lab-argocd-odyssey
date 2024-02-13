<template>
  <div class="slidev-layout cover">
    <div class="my-auto w-full">
      <slot />

      <div class="mt-12 flex flex-col">
        <p v-if="$slidev.configs.author">{{ $slidev.configs.author }}</p>
        <p v-if="$slidev.configs.event" class="pt-4">{{ $slidev.configs.event }}</p>
        <p v-if="$slidev.configs.date">{{ $slidev.configs.date }}</p>
      </div>
    </div>
  </div>
</template>
