import { defineShikiSetup } from "@slidev/types";

export default defineShikiSetup(async ({ loadTheme }) => {
  return {
    theme: {
      dark: await loadTheme("../../styles/tokyo-night.json"),
      light: await loadTheme("../../styles/tokyo-night.json"),
    },
  };
});
