import { Box, useTheme } from "@mui/material";
import Header from "../../components/Header";
import Accordion from "@mui/material/Accordion";
import AccordionSummary from "@mui/material/AccordionSummary";
import AccordionDetails from "@mui/material/AccordionDetails";
import Typography from "@mui/material/Typography";
import ExpandMoreIcon from "@mui/icons-material/ExpandMore";
import { tokens } from "../../theme";

const FAQ = () => {
    const theme = useTheme();
    const colors = tokens(theme.palette.mode);
    

    return (
        <Box m="20px">
            <Header title="FAQ" subtitle="Frequently Asked Questions Page" />

        <Accordion defaultExpanded>
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    An Important Question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>

        <Accordion >
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    Another Important Question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>

        <Accordion >
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    A Persistently Important Question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>

        <Accordion >
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    My Favorite Important Question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>

        <Accordion >
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    Random Important Question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>

        <Accordion >
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    Super Random Important Question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>

        <Accordion >
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    So Many Important Questions
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>

        <Accordion >
            <AccordionSummary expandIcon={<ExpandMoreIcon />} >
                <Typography color={colors.greenAccent[500]} variant="h5">
                    Do you really have another Important Question
                </Typography>
            </AccordionSummary>
            <AccordionDetails>
                <Typography>
                    The answer is always 42. No matter what you are asking, the answer is 42.
                </Typography>
            </AccordionDetails>
        </Accordion>
        </Box>
    )
}

export default FAQ