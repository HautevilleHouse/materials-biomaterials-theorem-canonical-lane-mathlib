import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace MaterialsBiomaterialsTheoremCanonicalLaneLean

structure MaterialsBiomaterialsFoundation where
  crystal : CrystalStructurePackage
  crystalEvidence : CrystalStructureEvidence crystal
  phaseDiagram : PhaseDiagramPackage crystal
  phaseDiagramEvidence : PhaseDiagramEvidence crystal phaseDiagram
  elasticity : ElasticityPackage crystal
  elasticityEvidence : ElasticityEvidence crystal elasticity
  fracture : FractureMechanicsPackage crystal elasticity
  fractureEvidence : FractureMechanicsEvidence crystal elasticity fracture
  biocompatibility : BiomaterialsCompatibilityPackage crystal elasticity fracture
  biocompatibilityEvidence : BiomaterialsCompatibilityEvidence crystal elasticity fracture biocompatibility

def MaterialsFoundationClosed (M : MaterialsBiomaterialsFoundation) : Prop :=
  CrystalStructureClosed M.crystal ∧
  PhaseDiagramClosed M.crystal M.phaseDiagram ∧
  ElasticityClosed M.crystal M.elasticity ∧
  FractureMechanicsClosed M.crystal M.elasticity M.fracture ∧
  BiomaterialsCompatibilityClosed M.biocompatibility

theorem materials_foundation_closed_from_evidence (M : MaterialsBiomaterialsFoundation) :
    MaterialsFoundationClosed M := by
  have h1 : CrystalStructureClosed M.crystal :=
    crystal_structure_closed_from_evidence M.crystal M.crystalEvidence
  have h2 : PhaseDiagramClosed M.crystal M.phaseDiagram :=
    phase_diagram_closed_from_evidence M.crystal M.phaseDiagram M.phaseDiagramEvidence
  have h3 : ElasticityClosed M.crystal M.elasticity :=
    elasticity_closed_from_evidence M.crystal M.elasticity M.elasticityEvidence
  have h4 : FractureMechanicsClosed M.crystal M.elasticity M.fracture :=
    fracture_mechanics_closed_from_evidence M.crystal M.elasticity M.fracture M.fractureEvidence
  have h5 : BiomaterialsCompatibilityClosed M.biocompatibility :=
    biomaterials_compatibility_closed_from_evidence M.biocompatibility M.biocompatibilityEvidence
  exact And.intro h1 (And.intro h2 (And.intro h3 (And.intro h4 h5)))

end HautevilleHouse
end MaterialsBiomaterialsTheoremCanonicalLaneLean