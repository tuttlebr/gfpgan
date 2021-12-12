# Default Results Location

This can be modified in the `docker-compose.yml` file's `source` key. Do not change `target`.

```yaml
    volumes:
      - type: bind
        source:  /original/photo/dir # <-------
        target: /app/gfpgan/inputs/whole_imgs/
      - type: bind
        source: /restored/photo/dir  # <-------
        target: /app/gfpgan/results/
```

Results folder will then be populate in the following structure:

```bash
results/
├── cmp # Comparison of restoration and original
│   ├── original_00.png
│   ├── original_01.png
├── cropped_faces # Identified original faces
│   ├── original_00.png
│   ├── original_01.png
├── README.md
├── restored_faces # Identified restored faces
│   ├── original_00_restored.png
│   ├── original_01_restored.png
└── restored_imgs # final restoration and scale image
    ├── original_restored.jpeg
```