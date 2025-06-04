{
  "metadata": {
    "version": 2
  },
  "flow": {
    "nodes": [
      {
        "id": 1,
        "module": "webhooks.customWebhook",
        "version": 1,
        "parameters": {
          "hookName": "Korean-Chat-Agent"
        },
        "mapper": {},
        "metadata": {
          "designer": {
            "x": 0,
            "y": 0
          },
          "restore": {
            "parameters": {
              "hookName": {
                "label": "Korean-Chat-Agent"
              }
            }
          },
          "parameters": [
            "hookName"
          ]
        }
      },
      {
        "id": 2,
        "module": "openai.createChatCompletion",
        "version": 1,
        "parameters": {
          "connection": "your-openai-connection",
          "model": "gpt-4-0125-preview"
        },
        "mapper": {
          "messages": [
            {
              "role": "system",
              "content": "Drive 검색에 필요한 핵심 키워드만 추출해야 합니다.\n출력은 반드시 다음 형식으로 작성하세요:\n\"키워드1, 키워드2, 키워드3\"\n\n예:\n입력: \"2023년 IR 자료 보여줘\" → 출력: \"IR, 2023\"\n입력: \"IR 발표자료랑 회사 소개서 좀 찾아줘\" → 출력: \"IR, 발표자료, 회사 소개서\"\n\n주의사항:\n- 불필요한 설명 없이 키워드만 출력하세요.\n- 항상 한국어로 입력을 처리하고 출력하세요."
            },
            {
              "role": "user",
              "content": "{{1.message}}"
            }
          ]
        },
        "metadata": {
          "designer": {
            "x": 300,
            "y": 0
          },
          "restore": {
            "parameters": {
              "model": {
                "label": "gpt-4-0125-preview"
              }
            }
          },
          "parameters": [
            "connection",
            "model"
          ]
        }
      },
      {
        "id": 3,
        "module": "google-drive.searchFiles",
        "version": 1,
        "parameters": {
          "connection": "your-google-connection"
        },
        "mapper": {
          "query": "name contains '{{2.choices[0].message.content}}' and trashed = false",
          "limit": 10
        },
        "metadata": {
          "designer": {
            "x": 600,
            "y": 0
          },
          "restore": {
            "parameters": {
              "connection": {
                "label": "your-google-connection"
              }
            }
          },
          "parameters": [
            "connection"
          ]
        }
      },
      {
        "id": 4,
        "module": "webhooks.respondToWebhook",
        "version": 1,
        "parameters": {},
        "mapper": {
          "status": 200,
          "body": "다음 파일을 찾았습니다:\n\n{{#3}}\n{{@index + 1}}. {{name}} → {{webViewLink}}\n{{/3}}"
        },
        "metadata": {
          "designer": {
            "x": 900,
            "y": 0
          }
        }
      }
    ],
    "connections": {
      "1": {
        "next": {
          "node": 2
        }
      },
      "2": {
        "next": {
          "node": 3
        }
      },
      "3": {
        "next": {
          "node": 4
        }
      }
    }
  }
}
