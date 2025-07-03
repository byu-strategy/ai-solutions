# Create project directories
dir.create("docs", showWarnings = FALSE)
dir.create("images", showWarnings = FALSE)

# List of all qmd files
qmd_files <- c(
  "index.qmd",
  "00-syllabus.qmd",
  "01-schedule.qmd",
  "pre-test.qmd",
  "reading-quizzes.qmd",
  "hw-1-prompt-engineering.qmd",
  "hw-2-rag.qmd",
  "hw-3-fine-tuning.qmd",
  "hw-4-agents.qmd",
  "hw-5-strategy-memo.qmd",
  "group-project.qmd",
  "final-exam.qmd",
  "02-foundations.qmd",
  "03-prompt-engineering.qmd",
  "04-prompt-programmatic.qmd",
  "05-retrieval-augmented-generation.qmd",
  "06-fine-tuning.qmd",
  "07-agents.qmd",
  "08-evaluation-and-tooling.qmd",
  "09-business-strategy.qmd",
  "90-resources.qmd",
  "98-faq.qmd",
  "99-references.qmd"
)

# Function to create a clean, readable title
make_readable_title <- function(filename) {
  base <- tools::file_path_sans_ext(basename(filename))
  
  # Special handling for HW files
  if (grepl("^hw-", base, ignore.case = TRUE)) {
    # Split into parts by dash
    parts <- unlist(strsplit(base, "-"))
    hw_number <- parts[2]
    hw_rest <- paste(parts[-c(1,2)], collapse = " ")
    hw_rest <- tools::toTitleCase(hw_rest)
    return(paste0("HW ", hw_number, " – ", hw_rest))
  }
  
  # Otherwise, normal handling
  base <- sub("^\\d+-", "", base)
  base <- gsub("[-_]", " ", base)
  base <- tools::toTitleCase(base)
  return(base)
}

# Create empty qmd files with a default header
for (file in qmd_files) {
  if (!file.exists(file)) {
    title <- make_readable_title(file)
    cat(
      paste0(
        "---\n",
        "title: \"", title, "\"\n",
        "format: html\n",
        "---\n\n",
        "# ", title, "\n"
      ),
      file = file
    )
  }
}

# Create placeholder references.bib
if (!file.exists("references.bib")) {
  cat(
    "@book{example,\n  title={Example Book},\n  author={Author, A.},\n  year={2020},\n  publisher={Publisher}\n}\n",
    file = "references.bib"
  )
}

# Create placeholder informs.csl
if (!file.exists("informs.csl")) {
  cat(
    "<style xmlns=\"http://purl.org/net/xbiblio/csl\">\n  <!-- Placeholder CSL -->\n</style>\n",
    file = "informs.csl"
  )
}

# Create placeholder styles.css
if (!file.exists("styles.css")) {
  cat(
    "/* Custom styles */\n",
    file = "styles.css"
  )
}

message("Project files created successfully.")
