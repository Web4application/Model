export interface Env {
  AI: Ai;
}

export default {
  async fetch(request, env): Promise<Response> {

    const response = await env.AI.run(
      "@cf/huggingface/distilbert-sst-2-int8",
      {
        text: "This pizza is great!",
      }
    );

    return Response.json(response);
  },
} satisfies ExportedHandler<Env>;
