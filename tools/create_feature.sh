#!/usr/bin/env bash
set -euo pipefail

if [ $# -ne 1 ]; then
  echo "Usage: ./tools/create_feature.sh feature_name"
  exit 1
fi

FEATURE_NAME="$1"
ROOT_DIR="lib/features/${FEATURE_NAME}"
TEMPLATE_DIR="lib/features/_feature_template"
UNIT_TEST_DIR="test/unit/features/${FEATURE_NAME}"
WIDGET_TEST_DIR="test/widget/features/${FEATURE_NAME}"

if [ ! -d "$TEMPLATE_DIR" ]; then
  echo "Template directory not found: $TEMPLATE_DIR"
  exit 1
fi

if [ -d "$ROOT_DIR" ]; then
  echo "Feature already exists: $ROOT_DIR"
  exit 1
fi

cp -R "$TEMPLATE_DIR" "$ROOT_DIR"
find "$ROOT_DIR" -type f | while read -r file; do
  new_file="$(echo "$file" | sed "s/_feature_template/${FEATURE_NAME}/g; s/feature/${FEATURE_NAME}/g")"
  if [ "$file" != "$new_file" ]; then
    mv "$file" "$new_file"
  fi
done

find "$ROOT_DIR" -depth -type d | while read -r dir; do
  new_dir="$(echo "$dir" | sed "s/_feature_template/${FEATURE_NAME}/g; s/feature/${FEATURE_NAME}/g")"
  if [ "$dir" != "$new_dir" ]; then
    mv "$dir" "$new_dir"
  fi
done

find "$ROOT_DIR" -type f \( -name '*.dart' -o -name '*.md' \) -print0 |
  xargs -0 sed -i     -e "s/Feature/${FEATURE_NAME^}/g"     -e "s/feature/${FEATURE_NAME}/g"

mkdir -p "$UNIT_TEST_DIR" "$WIDGET_TEST_DIR"
cat > "$UNIT_TEST_DIR/${FEATURE_NAME}_repository_test.dart" <<EOF
void main() {
  // TODO: add ${FEATURE_NAME} repository tests.
}
EOF

cat > "$UNIT_TEST_DIR/${FEATURE_NAME}_cubit_test.dart" <<EOF
void main() {
  // TODO: add ${FEATURE_NAME} cubit tests.
}
EOF

cat > "$WIDGET_TEST_DIR/${FEATURE_NAME}_page_test.dart" <<EOF
void main() {
  // TODO: add ${FEATURE_NAME} widget tests.
}
EOF

echo "Created feature scaffold at $ROOT_DIR"
echo "Created test stubs at $UNIT_TEST_DIR and $WIDGET_TEST_DIR"
