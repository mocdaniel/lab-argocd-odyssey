<template>
  <footer>
    <div
      class="absolute bottom-0 left-0 right-0 flex flex-row justify-end px-4 py-2"
    >
      <p v-if="$slidev.configs.event" class="gradient-text">
        {{ $slidev.configs.event }}
      </p>
    </div>
  </footer>
</template>
